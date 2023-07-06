using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Newtonsoft.Json;


namespace ZeytinYaglim.com.tr
{
    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int no = Convert.ToInt32(Request.QueryString["zid"]);
            if (no == 0)
            {
                Response.Redirect("Index.aspx");
            }
            else
            {
                string jsonFilePath = Server.MapPath("json.json");
                string json = File.ReadAllText(jsonFilePath);
                List<Products> list = JsonConvert.DeserializeObject<List<Products>>(json);

                List<Products> filteredProducts = list.Where(p => p.UrunNo == no.ToString()).ToList();
                rp_json.DataSource = filteredProducts;
                rp_json.DataBind();
            }
           

        }


      
    }
}