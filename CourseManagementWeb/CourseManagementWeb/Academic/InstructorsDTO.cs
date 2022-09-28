using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CourseManagementWeb.Academic
{
    public class InstructorsDTO
    {
        public int InstructorId { get; set; }
        public string InstructorName { get; set; }
        public string InstructorEmail { get; set;}
        public string InstructorPhone { get; set; }
    }
}