using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CourseManagementWeb.Academic
{
    public class InstructorsRepo : IInstructorsRepo, IDisposable
    {
        SqlConnection con;
        private int r;

        public InstructorsRepo()
        {
            this.con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbSubject"].ConnectionString);
        }
        public void Delete(InstructorsDTO dto)
        {
            throw new NotImplementedException();
        }

       

        public InstructorsDTO Get(int id)
        {
            throw new NotImplementedException();
        }

        public ICollection<InstructorsDTO> GetAll()
        {
            List<InstructorsDTO> instructors = new List<InstructorsDTO>();
            DataTable dt = new DataTable();
            using(SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM instructors", this.con))
            {
                da.Fill(dt);
                foreach(var r in dt.AsEnumerable())
                {
                    instructors.Add(new InstructorsDTO
                    {
                        InstructorId = r.Field<int>("instructorid"),
                        InstructorName = r.Field<string>("instructorsname"),
                        InstructorEmail = r.Field<string>("email"),
                        InstructorPhone = r.Field<string>("phone")
                    });
                }
                return instructors;
            }
        }

        public void Insert(InstructorsDTO dto)
        {
            string sql = @"INSERT INTO [instructors]
           ([istructorname]
           ,[email]
           ,[phone])
            VALUES
           (@istructorname
           ,@email
           ,@phone)";
            using (SqlCommand cmd = new SqlCommand(sql, this.con))
            {
                cmd.Parameters.AddWithValue("@instructorname", dto.InstructorName);
                cmd.Parameters.AddWithValue("@email", dto.InstructorEmail);
                cmd.Parameters.AddWithValue("@phone", dto.InstructorPhone);
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

        public void Update(InstructorsDTO dto)
        {
            throw new NotImplementedException();
        }
        public int InstructorCount()
        {
            using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM instructors", this.con))
            {
                this.con.Open();
                int n = (int)cmd.ExecuteScalar();
                this.con.Close();
                return n;
            }
        }
        public void Dispose()
        {
            if(con.State == System.Data.ConnectionState.Open)
            {
                con.Close();
            }
        }

        public int InstructorsCount()
        {
            throw new NotImplementedException();
        }
    }
}