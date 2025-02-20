using TaskyAndroid.scripts;
using UserServer;
namespace TaskyAndroid;

public partial class LoginPage : ContentPage
{
    private User user;
    private readonly ServiceHelper<IUserService> _userService;

    public LoginPage()
	{
		InitializeComponent();
        _userService = new ServiceHelper<IUserService>();
        user = new User();
	}
    private async void LoginClick(object sender, EventArgs e)
    {
        string email = EmailEntry.Text, password = PasswordEntry.Text;
        if (PasswordEntry.Text != null && PasswordEntry.Text != null)
        {
            try
            {
                User user = await _userService.CallServiceAsync(client => client.UserLoginAsync(email, password));
                if (user != null && user.userType != UserType.Admin)
                {
                    //Check if the user is logging in for the first time
                    //if yes, user has to change his password from the OTP
                    try
                    {
                        int OTP = int.Parse(user.password);
                    }
                    catch (Exception)
                    {
                        ErrorLabel.Text = "USER FOUND!";
                    }
                    await Navigation.PushAsync(new NewPasswordPage(user));
                }
                else
                {
                    ErrorLabel.Text = "Invalid Email or Password";
                }
            }
            catch (Exception ex)
            {
                ErrorLabel.Text = $"Unexpacted error, try again later\n{ex.Message}";
            }
        }
        else
        {
            ErrorLabel.Text = "There are empty fields";
        }
    }
}