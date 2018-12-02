using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MLApp;
using System.IO;

namespace PDI.WebForms
{
    public partial class parque : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                (this.Master as MasterPages.MasterPage).Menu_Parque().Attributes.Add("class", "active");

                _adicionalinha();

            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        private void _adicionalinha()
        {
            DirectoryInfo diretoria = new DirectoryInfo(@"C:\\Users\\Marcos\\Desktop\\PDI_Matriculas\\PDI\\PDI_Reconhecimento_de_Matriculas\\Matriculas");
            FileInfo[] ficheiros = diretoria.GetFiles();
            string NomeFicheiro = "";
            int lugar = 1;
            string NumeroMatricula = "";
            // Instância de MatLab
            MLApp.MLApp matlab = new MLApp.MLApp();

            try
            {

                foreach (FileInfo fich in ficheiros)
                {                

                    //Nome da imagem a tratar
                    NomeFicheiro = fich.Name;

                    //Substitui a palavra "FICHEIROAQUI"
                    string text = File.ReadAllText(@"C:\\Users\\Marcos\\Desktop\\PDI_Matriculas\\PDI\\PDI_Reconhecimento_de_Matriculas\\extracaoMatricula.m");
                    text = text.Replace("FICHEIROAQUI", "Matriculas/" + NomeFicheiro);
                    File.WriteAllText(@"C:\\Users\\Marcos\\Desktop\\PDI_Matriculas\\PDI\\PDI_Reconhecimento_de_Matriculas\\extracaoMatricula.m", text);
                                        
                    //Executa a funcao
                    matlab.Execute(@"cd C:\Users\Marcos\Desktop\PDI_Matriculas\PDI\PDI_Reconhecimento_de_Matriculas\");
                    matlab.Execute("extracaoMatricula");
                    //matlab.Quit();

                    //Adiciona linhas à tabela
                    TableRow tRow = new TableRow();
                    TabelaParque.Rows.Add(tRow);

                    TableCell tCellImg = new TableCell();
                    tCellImg.Text = string.Format("<img src='/PDI_Reconhecimento_de_Matriculas/Matriculas/" + NomeFicheiro + "' style=\"height: 50px;\" />");
                    tRow.Cells.Add(tCellImg);

                    TableCell tCellLugar = new TableCell();
                    tCellLugar.Text = lugar.ToString();
                    tRow.Cells.Add(tCellLugar);
                    lugar++;

                    var data = File.ReadAllText(Server.MapPath("~/PDI_Reconhecimento_de_Matriculas/numeroMatricula.txt"));
                    NumeroMatricula = data.ToString();

                    TableCell tCellMatricula = new TableCell();
                    tCellMatricula.Text = NumeroMatricula;
                    tRow.Cells.Add(tCellMatricula);

                    //Substitui de novo para a palavra "FICHEIROAQUI"
                    string texto = File.ReadAllText(@"C:\\Users\\Marcos\\Desktop\\PDI_Matriculas\\PDI\\PDI_Reconhecimento_de_Matriculas\\extracaoMatricula.m");
                    texto = texto.Replace("Matriculas/" + NomeFicheiro, "FICHEIROAQUI");
                    File.WriteAllText(@"C:\\Users\\Marcos\\Desktop\\PDI_Matriculas\\PDI\\PDI_Reconhecimento_de_Matriculas\\extracaoMatricula.m", texto);

                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}