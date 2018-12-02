using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace PDI.MasterPages
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        #region "Métodos Públicos"
        public HtmlGenericControl Menu_Dashboard()
        {
            try
            {
                return menuDashboard;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public HtmlGenericControl Menu_Parque()
        {
            try
            {
                return menuParque;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

    }

}