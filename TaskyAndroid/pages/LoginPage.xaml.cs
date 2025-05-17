using TaskyAndroid.scripts;
using TaskyAndroid.scripts.Service;
using UserServer;
using TaskyAndroid.pages;

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
        if (EmailEntry.Text != null && PasswordEntry.Text != null)
        {
            try
            {
                User user = await _userService.CallServiceAsync(client => client.UserLoginAsync(email, password));
                //User user = await  ServiceClientProvider.Instance.UserService.UserLoginAsync(email, password));
                if (user != null)
                {
                    //Check if the user is logging in for the first time
                    //if yes, user has to change his password from the OTP
                    try
                    {
                        int OTP;
                        if (int.TryParse(user.password, out OTP))
                        {
                            OTP = int.Parse(user.password);
                            await Navigation.PushAsync(new NewPasswordPage(user, false));
                        }
                        else
                        {
                            ErrorLabel.TextColor = Colors.Green;
                            ErrorLabel.Text = "Loading your account...";
                            await Navigation.PushAsync(new LobbyPage(user));
                        }
                    }
                    catch (Exception ex)
                    {
                        ErrorLabel.Text = ex.Message;
                    }
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

    private async void ResetPasswordClick(object sender, TappedEventArgs e)
    {
        //TODO : fix an error when link clicked
        User? user = await _userService.CallServiceAsync(client => client.GetUserByEmailAsync(EmailEntry.Text));
        if(user != null)
        {
            await Navigation.PushAsync(new NewPasswordPage(user, true));
        }
        else
        {
            ErrorLabel.Text = "Email adress wasn't found";
        }
    }
}