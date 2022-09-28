using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CourseManagementWeb.Academic
{
   public interface IInstructorsRepo
    {
        ICollection<InstructorsDTO> GetAll();
        InstructorsDTO Get(int id);
        void Insert(InstructorsDTO dto);
        void Update(InstructorsDTO dto);
        void Delete(InstructorsDTO dto);
        int InstructorsCount();

    }
}
