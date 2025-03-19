using CommunityToolkit.Maui;
using Microsoft.Extensions.Logging;

namespace TaskyAndroid
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .UseMauiCommunityToolkit(); // Initialize CommunityToolkit

            return builder.Build();
        }
    }
}
