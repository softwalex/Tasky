using CommunityToolkit.Maui.Views;
using UserServer;
using TaskyAndroid.scripts;

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
            if(assignment.forUser.ID == CurrentUserInShift._user.ID && assignment.forShift.ID == CurrentUserInShift._shift.ID)
				AssignmentsForCurrentUser.Add(assignment);
        }
		TaskList.ItemsSource = AssignmentsForCurrentUser;
    }

}