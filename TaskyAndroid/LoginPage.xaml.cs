using UserServer;
namespace TaskyAndroid;

public partial class LoginPage : ContentPage
{
    private UserServiceClient ServiceClient;
    private User user;
    public LoginPage()
	{
		InitializeComponent();
        ServiceClient = new UserServiceClient();
        user = new User();
	}
    private void LoginClick(object sender, EventArgs e)
    {
        return;
    }
}