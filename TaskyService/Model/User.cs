using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Serialization;

namespace Model
{
	[DataContract] public enum UserType { [EnumMember] Admin, [EnumMember] ShiftManager, [EnumMember] Worker };
	[DataContract]
    public class User : BaseEntity
    {
		private string FirstName;

		[DataMember]
		public string firstname
		{
			get { return FirstName; }
			set { FirstName = value; }
		}
		private string LastName;

		[DataMember]
		public string lastname
		{
			get { return LastName; }
			set { LastName = value; }
		}
		private string Email;

		[DataMember]
		public string email
		{
			get { return Email; }
			set { Email = value; }
		}
		private string Password;

		[DataMember]
		public string password
		{
			get { return Password; }
			set { Password = value; }
		}
		private DateTime Birthday;

		[DataMember]
		public DateTime birthday
		{
			get { return Birthday; }
			set { Birthday = value; }
		}

		private UserType UserType;

		[DataMember]
		public UserType userType
        {
			get { return UserType; }
			set { UserType = value; }
		}

	}

	[CollectionDataContract]
    public class UserList : List<User>
    {
        public UserList() { }
        public UserList(IEnumerable<User> list) : base(list.Cast<User>().ToList()) { }
        public UserList(IEnumerable<BaseEntity> list) : base(list.Cast<User>().ToList()) { }
        
		
        public UserList Search(string text)
        {
            return new UserList(this.FindAll(ce => ce.firstname.Contains(text) || ce.lastname.Contains(text) || ce.email.Contains(text)));
        }

        public UserList Search(UserType userType)
        {
            return new UserList(this.FindAll(ce => ce.userType.Equals(userType)));
        }

    }

}
