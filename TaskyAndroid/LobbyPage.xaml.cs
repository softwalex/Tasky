using TaskyAndroid.scripts;
using UserServer;
namespace TaskyAndroid;

public partial class LobbyPage : ContentPage
{
    private readonly ServiceHelper<IUserService> _userService;
    public LobbyPage()
	{
        InitializeComponent();
		_userService = new ServiceHelper<IUserService>();
		
	}
}