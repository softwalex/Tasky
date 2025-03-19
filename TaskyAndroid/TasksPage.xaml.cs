namespace TaskyAndroid;

public partial class TasksPage : ContentPage
{
	public TasksPage()
	{
		InitializeComponent();
	}
    // Toggle Item 1 visibility
    private void OnToggleItem1Clicked(object sender, EventArgs e)
    {
        Item1Content.IsVisible = !Item1Content.IsVisible;
    }

    // Toggle Item 2 visibility
    private void OnToggleItem2Clicked(object sender, EventArgs e)
    {
        Item2Content.IsVisible = !Item2Content.IsVisible;
    }
}