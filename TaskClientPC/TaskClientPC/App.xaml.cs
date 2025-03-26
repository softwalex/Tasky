using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;
using TaskClientPC.scripts;

namespace TaskClientPC
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        public App()
        {
            ImageManager.ImageDirectory = System.IO.Path.GetFullPath( System.IO.Path.Combine(Environment.CurrentDirectory,@"..\..\"))+@"images/UserTaskImages/";
        }
    }
}
