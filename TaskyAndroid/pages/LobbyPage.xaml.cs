using TaskyAndroid.scripts;
using UserServer;
using System.Timers;
using TaskyAndroid.pages;
namespace TaskyAndroid;

public partial class LobbyPage : ContentPage
{
    private readonly ServiceHelper<IUserService> _userService;
    private Shift CurrentShift;
    private User CurrentUser;
    private ShiftList shifts;
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
        if(CurrentShift != null)
            await AlreadyInShift();
        else
            ClockInFarme.IsVisible = false;
    }

    private async void ClockIn(object sender, EventArgs e)
    {
        if(CurrentShift != null && CurrentUser != null)
        {
            if (CurrentUser.userType == UserType.Admin)
            {
                userInShift = new UserInShift
                {
                    _user = CurrentUser,
                    _shift = CurrentShift,
                    isClockedIn = true,
                    userClockIn = DateTime.Now,
                    isClockedOut = false,
                };
                await _userService.CallServiceAsync(c => c.NewUserInShiftAsync(userInShift));
                await Navigation.PushAsync(new TasksPage(userInShift));
            }
            else
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

                UserInShiftList inShifts = await _userService.CallServiceAsync(c => c.GetAllUsersInShiftAsync());
                foreach (UserInShift us in inShifts)
                {
                    if ((us._user.userType == UserType.Admin || us._user.userType == UserType.ShiftManager) && us._shift.ID == userInShift._shift.ID && us.isClockedIn && !us.isClockedOut)
                        await _userService.CallServiceAsync(async c => c.SendEmailUsingTemplateAsyncAsync(us._user.email, $"Hello {us._user.firstname}, the user {userInShift._user.firstname} {userInShift._user.lastname}" +
                            $" has requested to join the current shift.\n({us._shift.shiftName} : {us._shift.start} => {us._shift.end})"));
                }

                ShowLoadingAnimation(true);
            }
        }
    }
    private async Task AlreadyInShift()
    {
        UserInShiftList userInShifts = await _userService.CallServiceAsync(c => c.GetAllUsersInShiftAsync());
        foreach(UserInShift us in userInShifts)
        {
            if(us._user.ID == CurrentUser.ID && us._shift.ID == CurrentShift.ID && !us.isClockedOut)
            {
                if (!us.isClockedIn)
                {
                    ShowLoadingAnimation(true);
                    break;
                }
                ClockInFarme.IsVisible = false;
                await Navigation.PushAsync(new TasksPage(us));
                return;
            }
        }
        ClockInFarme.IsVisible = true;
    }
    private void TimerElapsed(object? sender, ElapsedEventArgs e)
    {
        // Dispatch action to the main thread (without await)
        Dispatcher.Dispatch(async () =>
        {
            userInShiftList = await _userService.CallServiceAsync(c => c.GetUsersInShiftAsync(CurrentShift));
            foreach (UserInShift us in userInShiftList)
            {
                if (us._user.ID == CurrentUser.ID && us._shift.ID == CurrentShift.ID && us.isClockedIn && !us.isClockedOut)
                {
                    userInShift.userClockIn = DateTime.Now;
                    // Assuming _userService.CallServiceAsync is a Task-returning method
                    await _userService.CallServiceAsync(c => c.UpdateUserInShiftAsync(userInShift));
                    ShowLoadingAnimation(false);
                    _timer.Stop();
                    ClockInFarme.IsVisible = false;
                    await Navigation.PushAsync(new TasksPage(us));
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

    private async void LogoutClicked(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new LoginPage());
    }
}