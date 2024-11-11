using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Serialization;


namespace Model
{
	[DataContract]
    public class Shift : BaseEntity
    {
		private string ShiftName;

		[DataMember]
		public string shiftName
		{
			get { return ShiftName; }
			set { ShiftName = value; }
		}
		private DateTime Start;

		[DataMember]
		public DateTime strat
		{
			get { return Start; }
			set { Start = value; }
		}
		private DateTime End;

		[DataMember]
		public DateTime end
		{
			get { return End; }
			set { End = value; }
		}
	}

    [CollectionDataContract]
    public class ShiftList : List<Shift>
    {
        public ShiftList() { }
        public ShiftList(IEnumerable<UserInShift> list) : base(list.Cast<Shift>().ToList()) { }
        public ShiftList(IEnumerable<BaseEntity> list) : base(list.Cast<Shift>().ToList()) { }


        public ShiftList Search(string text)
        {
            return new ShiftList(this.FindAll(ce => (ce.shiftName.Equals(text))));
        }
    }
}
