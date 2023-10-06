using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace trabajoClase5
{
    public partial class cuentasModificacion : System.Web.UI.Page
    {

        //LOAD
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        //BOTONES        
        //Actualizar
        protected void actualizarBT_Click(object sender, EventArgs e)
        {
            if (idLB.Text != "-")
            {
                this.SqlDataSourceCuenta.UpdateParameters["descripcion"].DefaultValue = descripcionModificarTB.Text;
                this.SqlDataSourceCuenta.UpdateParameters["idCuenta"].DefaultValue = idLB.Text;
                this.SqlDataSourceCuenta.Update();
                this.resultadoLB.Text = "Se actualizó la Cuenta " + descripcionLB.Text + "." ;

                panelModificacion.Enabled = false;
                idLB.Text = "-";
                descripcionLB.Text = "-";
                idCuentaTB.Text = "";
                descripcionModificarTB.Text = "";
            }
            else
            {
                this.resultadoLB.Text = "No se busco la Cuenta.";
            }
        }
        //Buscar
        protected void buscarBT_Click(object sender, EventArgs e)
        {
            panelModificacion.Enabled = false;
            if (idCuentaTB.Text != "")
            {
                this.SqlDataSourceCuenta.SelectParameters["idCuenta"].DefaultValue = this.idCuentaTB.Text;
                this.SqlDataSourceCuenta.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registros;
                registros = (SqlDataReader)SqlDataSourceCuenta.Select(DataSourceSelectArguments.Empty);

                if (registros.Read())
                {
                    this.idLB.Text = registros["idCuenta"].ToString();
                    this.descripcionLB.Text = registros["descripcion"].ToString();
                    this.descripcionModificarTB.Text = registros["descripcion"].ToString();
                    panelModificacion.Enabled = true;
                }
                else
                {
                    this.resultadoLB.Text = "No existe la Cuenta.";
                }
            }
            else
            {
                this.resultadoLB.Text = "Faltan cargar datos.";
            }
        }
    }
}