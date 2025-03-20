using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UserServer;

namespace TaskyAndroid.scripts.Service
{
    internal class SharedData
    {
        private static readonly Lazy<SharedData> _instance = new Lazy<SharedData>(() => new SharedData());

        public static SharedData Instance => _instance.Value;

        // המשתמש הנוכחי
        private User _currentUser;

        // נתונים משותפים ששמורים בזיכרון
        public User CurrentUser
        {
            get { return _currentUser; }
            set { _currentUser = value; }
        }

        // רשימות שמכילות מידע מהשרת

        // רשימות מטמון למסכי החנות
        public Dictionary<string, List<BaseEntity>> CachedLists { get; set; }

        // בנאי פרטי
        private SharedData()
        {
            CachedLists = new Dictionary<string, List<BaseEntity>>();       
        }

        // (איפוס כל הנתונים (בהתנתקות
        public void Clear()
        {
            CurrentUser = null;
            CachedLists.Clear();
        }
    }
}
