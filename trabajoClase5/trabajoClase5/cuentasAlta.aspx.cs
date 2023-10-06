using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace trabajoClase5
{
    public partial class cuentasAlta : System.Web.UI.Page
    {

        //LOAD
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }


        //BOTONES
        //Agregar
        protected void agregarBT_Click(object sender, EventArgs e)
        {
            if (descripcionAgregarTB.Text != "")
            {
                this.SqlDataSourceCuentas.InsertParameters["descripcion"].DefaultValue = this.descripcionAgregarTB.Text;
                this.SqlDataSourceCuentas.Insert();
                this.resultadoLB.Text = "Se efectuó la carga.";
                this.descripcionAgregarTB.Text = "";                
            }
            else { this.resultadoLB.Text = "Faltan cargar datos."; }
        }        
    }
}