using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace trabajoClase5
{
    public partial class registrosContablesBaja : System.Web.UI.Page
    {
        //LOAD
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //BOTONES
        //Buscar
        protected void buscarBT_Click(object sender, EventArgs e)
        {
            if (idRegistroTB.Text != "")
            {
                this.SqlDataSourceRegistros.SelectParameters["idRegistrosContables"].DefaultValue = this.idRegistroTB.Text;
                this.SqlDataSourceRegistros.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registros;
                registros = (SqlDataReader)SqlDataSourceRegistros.Select(DataSourceSelectArguments.Empty);

                if (registros.Read())
                {
                    string datos;
                    this.idLB.Text = registros["idRegistrosContables"].ToString();
                    datos = "Cuenta: " + registros["descripcion"].ToString() + ", Monto: " +
                        registros["monto"].ToString();
                    if (registros["tipo"].ToString() == "1")
                    {
                        datos = datos + ", Tipo: " + "Haber";
                    }
                    else
                    {
                        datos = datos + ", Tipo: " + "Debe";
                    }
                    datosLB.Text = datos;
                }
                else
                {
                    this.resultadoLB.Text = "No existe el Registro.";
                }
            }
            else
            {
                this.resultadoLB.Text = "Faltan cargar datos.";
            }
        }
        //Eliminar
        protected void eliminarBT_Click(object sender, EventArgs e)
        {
            if (idLB.Text != "-")
            {
                this.SqlDataSourceRegistros.DeleteParameters["idRegistrosContables"].DefaultValue = idLB.Text;
                this.SqlDataSourceRegistros.Delete();
                this.resultadoLB.Text = "Se elimino el Registro " + datosLB.Text + ".";
                idLB.Text = "-";
                datosLB.Text = "-";
                idRegistroTB.Text = "";
            }
            else
            {
                this.resultadoLB.Text = "No se busco el Registro.";
            }
        }
    }
}