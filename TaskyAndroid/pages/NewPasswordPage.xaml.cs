using TaskyAndroid.scripts;
using UserServer;
using TaskyAndroid.pages;

namespace TaskyAndroid;

public partial class NewPasswordPage : ContentPage
{
    private User user;
    private readonly ServiceHelper<IUserService> _userService;
    private int ResetCode;
    private bool CodeFlag;
    public NewPasswordPage(User user, bool ResetFlag)
    {
        InitializeComponent();
        _userService = new ServiceHelper<IUserService>();
        this.user = user;
        CodeFlag = ResetFlag;
        if (ResetFlag)
        {
            ForgotPasswordLabel.IsVisible = true;
            ResetCode = SendResetCode(user).Result;
        }
        else{ForgotPasswordLabel.IsVisible = false;}
    }
    private async void SetPasswordClick(object sender, EventArgs e)
    {
        ErrorLabel.Text = "";
        string Len = "Password must be more than 5 chars and less than 20 chars";
        string UpLetter = "One or more Upper case letters is needed"; bool ContainUp = false;
        string LowLetter = "One or more Lower case letters is needed"; bool ContainLow = false;
        string NumLetter = "One or more Numbers"; bool ContainNum = false;

        //Check the reset password code
        if (CodeFlag)
        {
            if(CodeEntry.Text != ResetCode.ToString() || CodeEntry.Text == string.Empty)
            {
                ErrorLabel.Text = "Wrong Reset code, Check your email for the code";
                return;
            }
            else if(CodeEntry.Text == ResetCode.ToString())
            {
                ErrorLabel.Text = "";
            }
        }

        //Check new password and reset if password suitable
        if (PasswordEntry.Text != null && RepeatPasswordEntry.Text != null)
        {
            if (PasswordEntry.Text == RepeatPasswordEntry.Text)
            {
                for (int i = 0; i < PasswordEntry.Text.Length; i++)
                {
                    if (PasswordEntry.Text[i] >= 'A' && PasswordEntry.Text[i] <= 'Z')
                        ContainUp = true;
                    if (PasswordEntry.Text[i] >= 'a' && PasswordEntry.Text[i] <= 'z')
                        ContainLow = true;
                    if (int.TryParse(PasswordEntry.Text[i].ToString(), out _))
                        ContainNum = true;
                }

                if (PasswordEntry.Text.Length < 6 || PasswordEntry.Text.Length > 19) { ErrorLabel.Text += $"{Len}\n"; }
                if (!ContainUp) { ErrorLabel.Text += $"{UpLetter}\n"; }
                if (!ContainLow) { ErrorLabel.Text += $"{LowLetter}\n"; }
                if (!ContainNum) { ErrorLabel.Text += NumLetter; }

                if (ErrorLabel.Text == "")
                {
                    try
                    {
                        ErrorLabel.TextColor = Colors.Green;
                        ErrorLabel.Text = "Loading your account...";
                        user.password = PasswordEntry.Text;
                        await _userService.CallServiceAsync(client => client.UpdateUserAsync(user));
                        await Navigation.PushAsync(new LobbyPage(user));
                    }
                    catch (Exception ex)
                    {
                        ErrorLabel.Text = ex.Message;
                    }
                }
            }
            else
            {
                ErrorLabel.Text = "Password fields don't match";
            }
        }
        else
        {
            ErrorLabel.Text = "There are empty fields";
        }
    }
    public async Task<int> SendResetCode(User user)
    {
        Random random = new Random();
        int Code = random.Next(100000, 1000000);
        string Text = $"Hey {user.firstname}, Your Code for your password reset would be: {Code}";
        await _userService.CallServiceAsync(async client => client.SendEmailUsingTemplateAsyncAsync(user.email, Text));
        return Code;
    }
}