using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CourseManagementWeb.Academic
{
    public class CoursesDTO
    {
        public int CourseId { get; set; }
        public string Title { get; set; }
        public int TotalClass { get; set; }
        public int weeklyClass { get; set; }
        public int ClassDuration { get; set; }
        public decimal Fee { get; set; }
        public bool Available { get; set; }
        public int InstructorId { get; set; }
     
    }
}