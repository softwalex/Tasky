using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Serialization;

namespace Model
{
	public class UserInShift : BaseEntity
	{
		private User _User;
        [DataMember]
        public User _user
		{
			get { return _User; }
			set { _User = value; }
		}
		private Shift _Shift;

		[DataMember]
		public Shift _shift
		{
			get { return _Shift; }
			set { _Shift = value; }
		}

		private bool IsClockedIn;

		[DataMember]
		public bool isClockedIn
		{
			get { return IsClockedIn; }
			set { IsClockedIn = value; }
		}
		private DateTime UserClockIn;

		[DataMember]
		public DateTime userClockIn
		{
			get { return UserClockIn; }
			set { UserClockIn = value; }
		}
		private bool IsClockedOut;

		[DataMember]
		public bool isClockedOut
		{
			get { return IsClockedOut; }
			set { IsClockedOut = value; }
		}
		private DateTime UserClockOut;

		[DataMember]
		public DateTime userClockOut
		{
			get { return UserClockOut; }
			set { UserClockOut = value; }
		}

	}

    [CollectionDataContract]
    public class UserInShiftList : List<UserInShift>
	{
		public UserInShiftList() { }
		public UserInShiftList(IEnumerable<UserInShift> list) : base(list.Cast<UserInShift>().ToList()) { }
		public UserInShiftList(IEnumerable<BaseEntity> list) : base(list.Cast<UserInShift>().ToList()) { }


		public UserInShiftList Search(User user)
		{
			return new UserInShiftList(this.FindAll(ce => ce._user.ID.Equals(user.ID)));
		}
        public UserInShiftList Search(Shift shift)
        {
            return new UserInShiftList(this.FindAll(ce => ce._shift.ID.Equals(shift.ID)));
        }
    }
}
