using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Serialization;

namespace Model
{
	[DataContract]
    public class Assignment : BaseEntity
    {
		private string Subject;
		[DataMember]
		public string subject
		{
			get { return Subject; }
			set { Subject = value; }
		}
		private string Description;

		[DataMember]
		public string description
		{
			get { return Description; }
			set { Description = value; }
		}
		private string Image;

		[DataMember]
		public string image
		{
			get { return Image; }
			set { Image = value; }
		}
		private DateTime DateOfAssigment;

		[DataMember]
		public DateTime dateOfAssigment
		{
			get { return DateOfAssigment; }
			set { DateOfAssigment = value; }
		}
        private User DoneByUser;

        [DataMember]
        public User doneByUser
        {
            get { return DoneByUser; }
            set { DoneByUser = value; }
        }
        private string Summery;

        [DataMember]
        public string summery
        {
            get { return Summery; }
            set { Summery = value; }
        }
        private User ForUser;

        [DataMember]
        public User forUser
        {
            get { return ForUser; }
            set { ForUser = value; }
        }
		private Shift ForShift;

		public Shift forShift
        {
			get { return ForShift; }
			set { ForShift = value; }
		}
		private Category _Category;

		public Category _category
		{
			get { return _Category; }
			set { _Category = value; }
		}


	}

    [CollectionDataContract]
    public class AssignmentList : List<Assignment>
    {
        public AssignmentList() { }
        public AssignmentList(IEnumerable<UserInShift> list) : base(list.Cast<Assignment>().ToList()) { }
        public AssignmentList(IEnumerable<BaseEntity> list) : base(list.Cast<Assignment>().ToList()) { }


        public AssignmentList Search(string text)
        {
			return new AssignmentList(this.FindAll(ce => (ce.subject.Equals(text)) || ce.description.Equals(text)));
        }
    }
}
