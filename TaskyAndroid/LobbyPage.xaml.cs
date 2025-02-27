using TaskyAndroid.scripts;
using UserServer;
using System.Timers;
namespace TaskyAndroid;

public partial class LobbyPage : ContentPage
{
    private readonly ServiceHelper<IUserService> _userService;
	private ShiftList shifts;
	private Shift CurrentShift;
	private User CurrentUser;
    private UserInShift userInShift;
    private UserInShiftList userInShiftList;
    private System.Timers.Timer _timer;
    public LobbyPage(User user)
	{
		InitializeComponent();

        _timer = new System.Timers.Timer();
        _timer.Interval = 10000;
        _timer.Elapsed += TimerElapsed;
        _timer.Start();

        _userService = new ServiceHelper<IUserService>();
		shifts = new ShiftList();
		CurrentShift = new Shift();
        CurrentUser = new User();
        userInShift = new UserInShift();
        userInShiftList = new UserInShiftList();

		CurrentUser = user;
		UserInfoBorder.BindingContext = CurrentUser;
		_ = SetCurrentShiftBindingAsync();

    }
	public async Task SetCurrentShiftBindingAsync()
	{
		shifts = await _userService.CallServiceAsync(c => c.GetShiftsAsync());
		foreach(Shift s in shifts)
		{
			Console.WriteLine(DateTime.Now);
            Console.WriteLine($"Shift start: {s.start}, Shift end: {s.end}, Current time: {DateTime.Now}");
            if (s.start < DateTime.Now && s.end > DateTime.Now)
			{
				CurrentShift = s;
				break;
			}
		}
        CurrentShiftInfoBorder.BindingContext = CurrentShift;
        userInShiftList = await _userService.CallServiceAsync(c => c.GetUsersInShiftAsync(CurrentShift));
    }

    private async void ClockIn(object sender, EventArgs e)
    {
        if(CurrentShift != null && CurrentUser != null)
        {
            userInShift = new UserInShift
            {
                _user = CurrentUser,
                _shift = CurrentShift,
                isClockedIn = false,
                userClockIn = DateTime.Now,
                isClockedOut = false,
            };
            await _userService.CallServiceAsync(c => c.NewUserInShiftAsync(userInShift));
            ShowLoadingAnimation(true);
        }
    }
    private void TimerElapsed(object? sender, ElapsedEventArgs e)
    {
        // Dispatch action to the main thread (without await)
        Dispatcher.Dispatch(async () =>
        {
            foreach (UserInShift us in userInShiftList)
            {
                if (us._user == CurrentUser && us._shift == CurrentShift && us.isClockedIn)
                {
                    userInShift.userClockIn = DateTime.Now;
                    // Assuming _userService.CallServiceAsync is a Task-returning method
                    await _userService.CallServiceAsync(c => c.UpdateUserInShiftAsync(userInShift));
                    ShowLoadingAnimation(false);
                    _timer.Stop();
                }
            }
        });
    }



    protected override void OnDisappearing()
    {
        base.OnDisappearing();
        _timer.Stop();
    }
    private void ShowLoadingAnimation(bool isLoading)
    {
        // Toggle visibility of button and loading indicator
        ClockInButton.IsVisible = !isLoading;
        LoadingIndicator.IsVisible = isLoading;

        // Optional: Add a rotation animation to the loading spinner for extra effect
        if (isLoading)
        {
            // Start rotation animation
            var rotationAnimation = new Animation(v => LoadingSpinner.Rotation = v, 0, 360);
            rotationAnimation.Commit(this, "LoadingAnimation", 16, 1000, Easing.Linear, (v, c) => LoadingSpinner.Rotation = 0, () => true);
        }
        else
        {
            // Stop the animation
            this.AbortAnimation("LoadingAnimation");
        }
    }
}