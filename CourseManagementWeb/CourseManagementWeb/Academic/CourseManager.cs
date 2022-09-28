using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CourseManagementWeb.Academic
{
    public class CourseManager
    {
        SqlConnection con;

        public CourseManager()
        {
            this.con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbSubject"].ConnectionString);
        }
        public ICollection<CoursesDTO> GetAll()
        {
            List<CoursesDTO> courses = new List<CoursesDTO>();
            DataTable dt = new DataTable();
            using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM courses", this.con))
            {
                da.Fill(dt);
                foreach (var r in dt.AsEnumerable())
                {
                    courses.Add(new CoursesDTO
                    {
                        CourseId = r.Field<int>("courseid"),
                        Title = r.Field<string>("title"),
                        TotalClass = r.Field<int>("totalclass"),
                        weeklyClass = r.Field<int>("weeklyclass"),
                        ClassDuration = r.Field<int>("classduration"),
                        Fee = r.Field<decimal>("fee"),
                        Available=r.Field<bool>("available"),
                        InstructorId = r.Field<int>("instructorid")

                    });
                }
                return courses;
            }
        }
        public void Insert(CoursesDTO dto)
        {
            string sql = @"INSERT INTO [dbo].[courses]
           ([title]
           ,[totalclass]
           ,[weeklyclass]
           ,[classduration]
           ,[fee]
           ,[available]
           ,[instructorid])
            VALUES
           (@title
           ,@totalclass
           ,@weeklyclass
           ,@classduration
           ,@fee
           ,@available
           ,@instructorid)";
            using (SqlCommand cmd = new SqlCommand(sql, this.con))
            {
                cmd.Parameters.AddWithValue("@title", dto.Title);
                cmd.Parameters.AddWithValue("@totalclass", dto.TotalClass);
                cmd.Parameters.AddWithValue("@weeklyclass", dto.weeklyClass);
                cmd.Parameters.AddWithValue("@classduration", dto.ClassDuration);
                cmd.Parameters.AddWithValue("@fee", dto.Fee);
                cmd.Parameters.AddWithValue("@available", dto.Available);
                cmd.Parameters.AddWithValue("@instructorid", dto.InstructorId);
                this.con.Open();
                try
                {
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw ex.InnerException;
                }
                this.con.Close();
            }
        }
        public void Update(CoursesDTO dto) { }
        public void Delete(CoursesDTO dto) { }
        public DataTable InstructorDropItems()
        {
            using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM instructors", this.con))
            {
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }
    }
   
}
