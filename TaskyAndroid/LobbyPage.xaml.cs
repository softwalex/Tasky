using TaskyAndroid.scripts;
using UserServer;
namespace TaskyAndroid;

public partial class LobbyPage : ContentPage
{
    private readonly ServiceHelper<IUserService> _userService;
	private ShiftList shifts;
	private Shift CurrentShift;
	private User CurrentUser;
    public LobbyPage()
	{
		InitializeComponent();

        _userService = new ServiceHelper<IUserService>();
		shifts = new ShiftList();
		CurrentShift = new Shift();
		CurrentUser = new User();
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
        BindingContext = CurrentShift;
    }
}