using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Serialization;

namespace Model
{
	[DataContract]
    public class Category : BaseEntity
    {
		private string Name;
		[DataMember]
		public string name
		{
			get { return Name; }
			set { Name = value; }
		}

	}

    [CollectionDataContract]
    public class CategoryList : List<Category>
    {
        public CategoryList() { }
        public CategoryList(IEnumerable<UserInShift> list) : base(list.Cast<Category>().ToList()) { }
        public CategoryList(IEnumerable<BaseEntity> list) : base(list.Cast<Category>().ToList()) { }


        public CategoryList Search(string text)
        {
            return new CategoryList(this.FindAll(ce => (ce.name.Equals(text))));
        }
    }
}
