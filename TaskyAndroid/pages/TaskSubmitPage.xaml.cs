using UserServer;
using TaskyAndroid.scripts;
using TaskyAndroid.pages;
using CommunityToolkit.Maui.Alerts;
using CommunityToolkit.Maui.Core;
using CommunityToolkit.Maui.Core.Primitives;
using CommunityToolkit.Maui.Storage;
using System.Linq.Expressions;
using TaskyAndroid.scripts.Service;

namespace TaskyAndroid.pages;

public partial class TaskSubmitPage : ContentPage
{
    private readonly ServiceHelper<IUserService> _userService;
    private UserInShift CurrentUserInShift;
    private Assignment CurrentAssignmrnt;
    private Stream imageStream;

    public TaskSubmitPage(UserInShift userInShift, Assignment assignment)
    {
        InitializeComponent();
        _userService = new ServiceHelper<IUserService>();
        CurrentUserInShift = userInShift;
        CurrentAssignmrnt = assignment;

        UserInfoBorder.BindingContext = CurrentUserInShift._user;
        TaskInfoStackLayout.BindingContext = CurrentAssignmrnt;     
    }

    protected async override void OnNavigatedTo(NavigatedToEventArgs args)
    {
        base.OnNavigatedTo(args);

        MyCamera.CameraFlashMode = CameraFlashMode.Auto;
        MyCamera.SelectedCamera = MyCamera.GetAvailableCameras(CancellationToken.None).Result.Where(c => c.Position == CameraPosition.Rear).FirstOrDefault();
    }

    // Implemented as a follow up video https://youtu.be/JUdfA7nFdWw
    protected override void OnNavigatedFrom(NavigatedFromEventArgs args)
    {
        base.OnNavigatedFrom(args);

        MyCamera.MediaCaptured -= MyCamera_MediaCaptured;
        MyCamera.Handler?.DisconnectHandler();
    }

    private void MyCamera_MediaCaptured(object sender, CommunityToolkit.Maui.Views.MediaCapturedEventArgs e)
    {
        imageStream = e.Media;
        if (Dispatcher.IsDispatchRequired)
        {
            Dispatcher.Dispatch(() => MyImage.Source = ImageSource.FromStream(() => e.Media));
            MyImage.BindingContext = e.Media;
            return;
        }
        imageStream = e.Media;
        MyImage.Source = ImageSource.FromStream(() => e.Media);
    }

    private async void TakePictureClicked(object sender, EventArgs e)
    {
        try
        {
            await MyCamera.CaptureImage(CancellationToken.None);
           
            MyImage.IsVisible = true;
            ImageUploadButton.IsVisible = true;
            ImageStackLayout.IsVisible = false;
           
        }
        catch (Exception ex)
        {
            await Toast.Make($"Error taking picture: {ex.Message}").Show();
        }
    }

    private void OnImageUploadClicked(object sender, EventArgs e)
    {
        ImageStackLayout.IsVisible = true;
        ImageUploadButton.IsVisible = false;
        MyImage.IsVisible = false;
    }

    //TODO : Implement submission logic
    private async void OnSubmitButtonClicked(object sender, EventArgs e)
    {
        // Submission logic here
        try
        {
            ImageManger manger = new ImageManger();
            string imageName = CurrentAssignmrnt.subject + CurrentAssignmrnt.dateOfAssigment + ".jpg";
            manger.SaveImageToService(imageStream, imageName);

            CurrentAssignmrnt.image = imageName;
            CurrentAssignmrnt.doneByUser = CurrentUserInShift._user;
            CurrentAssignmrnt.summery = InputSummryEditor.Text;

            await _userService.CallServiceAsync(c => c.UpdateAssignmentAsync(CurrentAssignmrnt));
            await Navigation.PushAsync(new TasksPage(CurrentUserInShift));
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }
    }
}
