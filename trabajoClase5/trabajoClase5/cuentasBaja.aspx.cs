using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace trabajoClase5
{
    public partial class cuentasBaja : System.Web.UI.Page
    {
        //LOAD
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //BOTONES
        //Eliminar
        protected void eliminarBT_Click(object sender, EventArgs e)
        {
            if (idLB.Text != "-")
            {
                this.SqlDataSourceCuenta.DeleteParameters["idCuenta"].DefaultValue = idLB.Text;
                this.SqlDataSourceCuenta.Delete();
                this.resultadoLB.Text = "Se elimino la Cuenta " + descripcionLB.Text +".";
                idLB.Text = "-";
                descripcionLB.Text = "-";
                idCuentaTB.Text = "";
            }
            else
            {
                this.resultadoLB.Text = "No se busco la Cuenta.";
            }
        }
        //Buscar
        protected void buscarBT_Click(object sender, EventArgs e)
        {
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