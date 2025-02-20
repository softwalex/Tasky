using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;

namespace TaskClientPC.scripts
{
    public class TaskyMessageBox : Window
    {
        private TextBlock headerText;
        private TextBlock messageText;

        public TaskyMessageBox()
        {
            WindowStyle = WindowStyle.None;
            ResizeMode = ResizeMode.NoResize;
            WindowStartupLocation = WindowStartupLocation.CenterScreen;
            Height = 500;
            Width = 400;
            Background = new SolidColorBrush((Color)ColorConverter.ConvertFromString("#bab8b5"));
            AllowsTransparency = false;

            // Define the layout
            var mainGrid = new Grid
            {
                Margin = new Thickness(0),
            };

            mainGrid.RowDefinitions.Add(new RowDefinition { Height = GridLength.Auto }); // For Header
            mainGrid.RowDefinitions.Add(new RowDefinition { Height = new GridLength(1, GridUnitType.Star) }); // For Message Text
            mainGrid.RowDefinitions.Add(new RowDefinition { Height = GridLength.Auto }); // For Button Panel

            // Header
            var headerBorder = CreateHeaderBorder();
            Grid.SetRow(headerBorder, 0);
            mainGrid.Children.Add(headerBorder);

            // Message
            messageText = CreateMessageText();
            Grid.SetRow(messageText, 1);
            mainGrid.Children.Add(messageText);

            // Buttons
            var buttonPanel = CreateButtonPanel();
            Grid.SetRow(buttonPanel, 2);
            mainGrid.Children.Add(buttonPanel);

            Content = mainGrid; // Set content to main grid layout
        }

        private Border CreateHeaderBorder()
        {
            var headerBorder = new Border
            {
                Background = new SolidColorBrush((Color)ColorConverter.ConvertFromString("#FF9800")),
                Height = 50,
                VerticalAlignment = VerticalAlignment.Top,
                CornerRadius = new CornerRadius(12, 12, 0, 0),
            };

            headerText = new TextBlock
            {
                Foreground = new SolidColorBrush(Colors.White),
                FontSize = 18,
                FontWeight = FontWeights.SemiBold,
                VerticalAlignment = VerticalAlignment.Center,
                Margin = new Thickness(20, 0, 0, 0),
            };

            headerBorder.Child = headerText;
            return headerBorder;
        }

        private TextBlock CreateMessageText()
        {
            var messageText = new TextBlock
            {
                Foreground = new SolidColorBrush(Colors.Black), // Changed to black for visibility
                FontSize = 16,
                TextWrapping = TextWrapping.Wrap,
                VerticalAlignment = VerticalAlignment.Center,
                HorizontalAlignment = HorizontalAlignment.Center,
                Margin = new Thickness(20, 10, 20, 10),
            };
            return messageText;
        }

        private StackPanel CreateButtonPanel()
        {
            var buttonPanel = new StackPanel
            {
                Orientation = Orientation.Horizontal,
                HorizontalAlignment = HorizontalAlignment.Center,
                VerticalAlignment = VerticalAlignment.Bottom,
                Margin = new Thickness(0, 0, 0, 20),
            };

            buttonPanel.Children.Add(CreateButton("OK", "#FB8C00", true));
            buttonPanel.Children.Add(CreateButton("Cancel", "#3b3937", false));

            return buttonPanel;
        }

        private Button CreateButton(string content, string color, bool isOkButton)
        {
            var button = new Button
            {
                Content = content,
                Width = 100,
                Height = 35,
                Margin = new Thickness(10, 0, 10, 0),
                Background = new SolidColorBrush((Color)ColorConverter.ConvertFromString(color)),
                Foreground = new SolidColorBrush(Colors.White),
            };

            button.Click += (sender, e) =>
            {
                DialogResult = isOkButton;
                Close();
            };

            return button;
        }

        // Properties
        public string Message
        {
            get => messageText.Text;
            set
            {
                messageText.Text = value; // Directly set the message in the TextBlock
                Console.WriteLine("Message Set: " + value);
            }
        }

        public new string Title
        {
            get => headerText.Text;
            set
            {
                headerText.Text = value; // Directly set the title in the header TextBlock
                Console.WriteLine("Title Set: " + value);
            }
        }

        public static bool? Show(string title, string message, Window owner = null)
        {
            var msgBox = new TaskyMessageBox
            {
                Title = title,  // Set title to message box
                Message = message,  // Set message to message box
                Owner = owner
            };

            return msgBox.ShowDialog();
        }
    }
}
