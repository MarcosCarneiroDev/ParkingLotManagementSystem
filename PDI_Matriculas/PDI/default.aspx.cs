using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PDI
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                (this.Master as MasterPages.MasterPage).Menu_Dashboard().Attributes.Add("class", "active");
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}