using CommunityToolkit.Maui.Views;
using UserServer;
using TaskyAndroid.scripts;
using TaskyAndroid.pages;

namespace TaskyAndroid;

public partial class TasksPage : ContentPage
{
    private readonly ServiceHelper<IUserService> _userService;
    private UserInShift CurrentUserInShift;
	private AssignmentList AssignmentsForCurrentUser;
	public TasksPage(UserInShift userInShift)
	{
		InitializeComponent();
		_userService = new ServiceHelper<IUserService>();
		CurrentUserInShift = userInShift;
		AssignmentsForCurrentUser = new AssignmentList();
		UserInfoBorder.BindingContext = CurrentUserInShift._user;
		_ = SetAssignments(CurrentUserInShift._user, CurrentUserInShift._shift);

    }
	public async Task SetAssignments(User user, Shift shift)
	{
		AssignmentList assignmentsList = await _userService.CallServiceAsync(c => c.GetAssignmentsAsync());
        foreach (Assignment assignment in assignmentsList)
        {
            if(assignment.forUser.ID == CurrentUserInShift._user.ID && assignment.forShift.ID == CurrentUserInShift._shift.ID && assignment.doneByUser == null)
				AssignmentsForCurrentUser.Add(assignment);
        }
		TaskList.ItemsSource = AssignmentsForCurrentUser;
    }

	private async void NvigateToSubmitClicked(object sender, EventArgs e)
	{
		TaskSubmitPage page = new TaskSubmitPage(CurrentUserInShift, (sender as Button).BindingContext as Assignment);
        await Navigation.PushAsync(page);
	}

    private async void ClockoutClicked(object sender, EventArgs e)
    {
		CurrentUserInShift.isClockedOut = true;
		CurrentUserInShift.userClockOut = DateTime.Now;
		await _userService.CallServiceAsync(c => c.FullUpdateUserInShiftAsync(CurrentUserInShift));
		await Navigation.PushAsync(new LobbyPage(CurrentUserInShift._user));

    }
}