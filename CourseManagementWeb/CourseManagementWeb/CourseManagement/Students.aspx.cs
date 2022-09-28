using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CourseManagementWeb.CourseManagement
{
    public partial class Students : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
          var fu = ListView1.InsertItem.FindControl("fu") as FileUpload;
                if (fu.HasFile)
                {
                    if (fu.PostedFile.ContentLength > 0)
                    {
                        string filePath = Guid.NewGuid() + Path.GetExtension(fu.FileName);
                        fu.PostedFile.SaveAs(Server.MapPath($"~/Uploads/{filePath}"));
                        e.Values["picture"] = filePath;
                    }
                }
            
        }
    }
}