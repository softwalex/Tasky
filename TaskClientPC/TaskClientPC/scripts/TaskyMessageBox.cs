using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;

namespace TaskClientPC.scripts
{
    public class TaskyMessageBox : Window
    {
        public TaskyMessageBox()
        {
            WindowStyle = WindowStyle.None;
            ResizeMode = ResizeMode.NoResize;
            WindowStartupLocation = WindowStartupLocation.CenterScreen;
            Height = 200;
            Width = 400;
            Background = new SolidColorBrush(Colors.White);
            AllowsTransparency = true;

            // Create the XAML template in code
            var template = new ControlTemplate();
            var border = new FrameworkElementFactory(typeof(Border));
            border.SetValue(Border.CornerRadiusProperty, new CornerRadius(12));
            border.SetValue(Border.BackgroundProperty, Background);
            border.SetValue(Border.EffectProperty, new System.Windows.Media.Effects.DropShadowEffect
            {
                BlurRadius = 15,
                Direction = 270,
                ShadowDepth = 3,
                Opacity = 0.3
            });

            var mainGrid = new FrameworkElementFactory(typeof(Grid));
            mainGrid.AppendChild(CreateHeaderBorder());
            mainGrid.AppendChild(CreateMessageText());
            mainGrid.AppendChild(CreateButtonPanel());

            border.AppendChild(mainGrid);
            template.VisualTree = border;
            Template = template;
        }

        private FrameworkElementFactory CreateHeaderBorder()
        {
            var headerBorder = new FrameworkElementFactory(typeof(Border));
            headerBorder.SetValue(Border.BackgroundProperty, new SolidColorBrush((Color)ColorConverter.ConvertFromString("#FF9800")));
            headerBorder.SetValue(Border.HeightProperty, 50.0);
            headerBorder.SetValue(Border.VerticalAlignmentProperty, VerticalAlignment.Top);
            headerBorder.SetValue(Border.CornerRadiusProperty, new CornerRadius(12, 12, 0, 0));

            var headerText = new FrameworkElementFactory(typeof(TextBlock));
            headerText.SetValue(TextBlock.TextProperty, Title);
            headerText.SetValue(TextBlock.ForegroundProperty, new SolidColorBrush(Colors.White));
            headerText.SetValue(TextBlock.FontSizeProperty, 18.0);
            headerText.SetValue(TextBlock.FontWeightProperty, FontWeights.SemiBold);
            headerText.SetValue(TextBlock.VerticalAlignmentProperty, VerticalAlignment.Center);
            headerText.SetValue(TextBlock.MarginProperty, new Thickness(20, 0, 0, 0));

            headerBorder.AppendChild(headerText);
            return headerBorder;
        }

        private FrameworkElementFactory CreateMessageText()
        {
            var messageText = new FrameworkElementFactory(typeof(TextBlock));
            messageText.SetValue(TextBlock.TextProperty, Message);
            messageText.SetValue(TextBlock.ForegroundProperty, new SolidColorBrush((Color)ColorConverter.ConvertFromString("#121111")));
            messageText.SetValue(TextBlock.FontSizeProperty, 14.0);
            messageText.SetValue(TextBlock.TextWrappingProperty, TextWrapping.Wrap);
            messageText.SetValue(TextBlock.VerticalAlignmentProperty, VerticalAlignment.Center);
            messageText.SetValue(TextBlock.HorizontalAlignmentProperty, HorizontalAlignment.Center);
            messageText.SetValue(TextBlock.MarginProperty, new Thickness(20, 60, 20, 60));
            return messageText;
        }

        private FrameworkElementFactory CreateButtonPanel()
        {
            var buttonPanel = new FrameworkElementFactory(typeof(StackPanel));
            buttonPanel.SetValue(StackPanel.OrientationProperty, Orientation.Horizontal);
            buttonPanel.SetValue(StackPanel.HorizontalAlignmentProperty, HorizontalAlignment.Center);
            buttonPanel.SetValue(StackPanel.VerticalAlignmentProperty, VerticalAlignment.Bottom);
            buttonPanel.SetValue(StackPanel.MarginProperty, new Thickness(0, 0, 0, 20));

            buttonPanel.AppendChild(CreateButton("OK", "#FB8C00", true));
            buttonPanel.AppendChild(CreateButton("Cancel", "#E0E0E0", false));

            return buttonPanel;
        }

        private FrameworkElementFactory CreateButton(string content, string color, bool isOkButton)
        {
            var button = new FrameworkElementFactory(typeof(Button));
            button.SetValue(Button.ContentProperty, content);
            button.SetValue(Button.WidthProperty, 100.0);
            button.SetValue(Button.HeightProperty, 35.0);
            button.SetValue(Button.MarginProperty, new Thickness(10, 0, 10, 0));
            button.SetValue(Button.BackgroundProperty, new SolidColorBrush((Color)ColorConverter.ConvertFromString(color)));
            button.SetValue(Button.ForegroundProperty, new SolidColorBrush(Colors.White));
            button.SetValue(Button.StyleProperty, Application.Current.Resources["MaterialDesignRaisedButton"]);

            button.AddHandler(Button.ClickEvent, new RoutedEventHandler((sender, e) =>
            {
                DialogResult = isOkButton;
                Close();
            }));

            return button;
        }

        public string Message { get; set; }

        public static bool? Show(string title, string message, Window owner = null)
        {
            var msgBox = new TaskyMessageBox
            {
                Title = title,
                Message = message,
                Owner = owner
            };

            return msgBox.ShowDialog();
        }
    }
}
