using UserServer;
namespace TaskyApp;

public partial class LoginPage : ContentPage
{
    private UserServiceClient ServiceClient;
    private User user;
    private UserList users;
    public LoginPage()
	{
		InitializeComponent();
        ServiceClient = new UserServiceClient();
        user = new User();
        users = ServiceClient.GetUsersAsync().Result;
    }
    private void LoginClick(object sender, EventArgs e)
    {
    }
}