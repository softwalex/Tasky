using UserServer;
using TaskyAndroid.scripts;
using TaskyAndroid.pages;

namespace TaskyAndroid.pages;

public partial class TaskSubmitPage : ContentPage
{
    private readonly ServiceHelper<IUserService> _userService;
    private User CurrentUser;
    private Assignment CurrentAssignmrnt;
	public TaskSubmitPage(User user, Assignment assignment)
	{
		InitializeComponent();
        _userService = new ServiceHelper<IUserService>();
        CurrentUser = user;
        CurrentAssignmrnt = assignment;

        UserInfoBorder.BindingContext = CurrentUser;
        TaskInfoStackLayout.BindingContext = CurrentAssignmrnt;
	}

    private void OnImageUploadClicked(object sender, EventArgs e)
    {

    }

    private void OnSubmitButtonClicked(object sender, EventArgs e)
    {

    }
}