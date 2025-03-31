using UserServer;
using TaskyAndroid.scripts;
using TaskyAndroid.pages;
using CommunityToolkit.Maui.Alerts;
using CommunityToolkit.Maui.Core;
using CommunityToolkit.Maui.Core.Primitives;
using CommunityToolkit.Maui.Storage;
using System.Linq.Expressions;

namespace TaskyAndroid.pages;

public partial class TaskSubmitPage : ContentPage
{
    private readonly ServiceHelper<IUserService> _userService;
    private User CurrentUser;
    private Assignment CurrentAssignmrnt;
    private Stream imageStream;

    public TaskSubmitPage(User user, Assignment assignment)
    {
        InitializeComponent();
        _userService = new ServiceHelper<IUserService>();
        CurrentUser = user;
        CurrentAssignmrnt = assignment;

        UserInfoBorder.BindingContext = CurrentUser;
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
            return;
        }

        MyImage.Source = ImageSource.FromStream(() => e.Media);
    }

    private async void TakePictureClicked(object sender, EventArgs e)
    {
        try
        {
            await MyCamera.CaptureImage(CancellationToken.None);
           
                MyImage.IsVisible = true;
                ImageUploadButton.IsEnabled = true;
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

    private void OnSubmitButtonClicked(object sender, EventArgs e)
    {
        // Submission logic here
    }
}
