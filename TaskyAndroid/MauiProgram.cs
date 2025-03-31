using CommunityToolkit.Maui;
using Microsoft.Extensions.Logging;
using TaskyAndroid.pages;

namespace TaskyAndroid
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .UseMauiCommunityToolkit() // Initialize CommunityToolkit
            .UseMauiCommunityToolkitCamera()
              .ConfigureFonts(fonts =>
               {
                   fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                   fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
               });

            builder.Services.AddTransient<TaskSubmitPage>();

#if DEBUG
            builder.Logging.AddDebug();
#endif
            return builder.Build();
        }
    }
}
