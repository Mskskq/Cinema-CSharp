using CinemaPR;
using System;
using System.Windows;
using System.Windows.Controls; // Теперь эта строчка загорится и сработает!
using System.Windows.Media;

namespace TestProject1
{
    [TestClass]
    public sealed class Test1
    {
        public List<Button> selectedSeats = new List<Button>();

        [TestMethod]
        public void Test12()
        {
            var mainWindow = new MainWindow();

            if (mainWindow.selectedSeats == null)
            {
                mainWindow.selectedSeats = new System.Collections.Generic.List<int>();
            }

            this.GenerateButton(119);

            Assert.AreEqual(120, selectedSeats.Count());
        }

        public void GenerateButton(int CountSeat)
        {
            if (CountSeat == 0)
            {

            }
            else
            {
                selectedSeats.Clear();

                for (int i = 0; i <= CountSeat; i++)
                {
                    Button ButtonSeat = new Button();
                    ButtonSeat.Content = i.ToString();
                    ButtonSeat.Width = 25;
                    ButtonSeat.Height = 25;

                    ButtonSeat.Background = (Brush)new BrushConverter().ConvertFrom("#5646A8");

                    ButtonSeat.Resources.Add(typeof(Border), new Style(typeof(Border))
                    {
                        Setters = { new Setter(Border.CornerRadiusProperty, new CornerRadius(5)) }
                    });
                    ButtonSeat.Margin = new Thickness(5);
                    selectedSeats.Add(ButtonSeat);
                }
            }
        }
    }
}

