using CommunityToolkit.Maui.Views;
using UserServer;
using TaskyAndroid.scripts;
using TaskyAndroid.pages;

namespace TaskyAndroid.pages;

public partial class UserListPage : ContentPage
{
    private readonly ServiceHelper<IUserService> _userService;
    private UserInShiftList usersInShift;
    private UserInShift CurrentUserInShift;
    public UserListPage(UserInShift userInShift)
    {
        InitializeComponent();
        _userService = new ServiceHelper<IUserService>();
        CurrentUserInShift = userInShift;
        UserInfoBorder.BindingContext = CurrentUserInShift._user;
        usersInShift = new UserInShiftList();
        _ = SetUsersInShift();
    }
    public async Task SetUsersInShift()
    {
        UserInShiftList users = await _userService.CallServiceAsync(c => c.GetAllUsersInShiftAsync());
        UserInShiftList CurrentShiftUsers = new UserInShiftList();
        foreach (UserInShift user in users)
        {
            if (user._shift.ID == CurrentUserInShift._shift.ID && !user.isClockedOut && user._user.ID != CurrentUserInShift._user.ID)
            {
                CurrentShiftUsers.Add(user);
            }
        }
        ShiftUsersList.ItemsSource = null;
        ShiftUsersList.ItemsSource = CurrentShiftUsers.OrderBy(u => u.isClockedIn);
    }

    private async void NavigateToTasksPage(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new TasksPage(CurrentUserInShift));
    }

    private async void AcceptClicked(object sender, EventArgs e)
    {
        if (sender is Button button && button.CommandParameter is UserInShift user)
        {
            user.isClockedIn = true;
            user.userClockIn = DateTime.Now;
            await _userService.CallServiceAsync(c => c.UpdateUserInShiftAsync(user));
            await SetUsersInShift();
        }
    }

    private async void DenyClicked(object sender, EventArgs e)
    {
        if (sender is Button button && button.CommandParameter is UserInShift user)
        {
            await _userService.CallServiceAsync(c => c.DeleteUserInShiftAsync(user));
            await SetUsersInShift();
        }
    }
}