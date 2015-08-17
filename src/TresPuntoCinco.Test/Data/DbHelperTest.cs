using Microsoft.VisualStudio.TestTools.UnitTesting;
using TresPuntoCinco.Model;

namespace TresPuntoCinco.Test.Data
{
	[TestClass]
	public class DbHelperTest
	{
		[TestMethod]
		public void InsertarSinClavePrimaria()
		{
			string textoInsert = TresPuntoCinco.Data.InsertHelper.GetInsertWithoutPrimaryKey(new Lugar { IdLugar = 1, NombreLugar = "", NombreCorto = "" });

			Assert.AreEqual("INSERT INTO Lugar (NombreLugar, NombreCorto) VALUES (@NombreLugar, @NombreCorto)", textoInsert);
		}

		[TestMethod]
		public void InsertarTodasLasColumnas()
		{
			string textoInsert = TresPuntoCinco.Data.InsertHelper.GetInsertAllColumns(new Lugar { IdLugar = 1, NombreLugar = "", NombreCorto = "" });

			Assert.AreEqual("INSERT INTO Lugar (IdLugar, NombreLugar, NombreCorto) VALUES (@IdLugar, @NombreLugar, @NombreCorto)", textoInsert);
		}
	}
}
