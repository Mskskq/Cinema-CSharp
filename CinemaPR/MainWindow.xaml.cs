using CinemaPR.Models;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using Microsoft.EntityFrameworkCore.Metadata.Internal;

namespace CinemaPR
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            GenerateDataGridSeand();
        }
        CinemaContext DataBase = new CinemaContext();
        private List<int> selectedSeats = new List<int>();

        public void GenerateDataGridSeand()
        {
            //гениальна логика чтение сеансов добавлние данных по свзм А ПАТОМ СРАЗУ СБОРКА В МОЙ СОЗДАННЫЙ ОБЪЕКТ И ЗАНЕСЕНИЕ В ЛИСт
            SeansDataGrid.ItemsSource = DataBase.Seans.Include(s => s.FkFilmNavigation).Include(s => s.HallFkNavigation).Select(s => new ObjectCeans
            {
                Sean = s,
                FilmName = s.FkFilmNavigation.Names,
                Length = s.FkFilmNavigation.Length,
                Price = s.Price,
                Time = s.DateTime,
                HallNumber = s.HallFkNavigation.Id
            }).ToList();
        }

        public void ButtonSeatEvent(object sender, RoutedEventArgs e)
        {
            Button clickedButton = (Button)sender;
            int seatNumber = Convert.ToInt32(clickedButton.Content);

            if(clickedButton.Tag != null && clickedButton.Tag.ToString() == "Active")
            {
                clickedButton.Tag = "Normal";
                clickedButton.Background = Brushes.LightGray;
                selectedSeats.Remove(seatNumber);
            }
            else
            {
                clickedButton.Tag = "Active";
                clickedButton.Background = Brushes.LightGreen;
                selectedSeats.Add(seatNumber);
            }
        }

        public void GenerateButton(int CountSeat)
        {
            MyContainer.Children.Clear();
            for (int i = 0; i <= CountSeat; i++)
            {
                Button ButtonSeat = new Button();
                ButtonSeat.Content = i.ToString();
                ButtonSeat.Width = 25;
                ButtonSeat.Height = 25;
                ButtonSeat.Click += ButtonSeatEvent;
                ButtonSeat.Resources.Add(typeof(Border), new Style(typeof(Border))
                {
                    Setters = { new Setter(Border.CornerRadiusProperty, new CornerRadius(5)) } // Радиус = половина высоты
                });
                ButtonSeat.Margin = new Thickness(5);
                MyContainer.Children.Add(ButtonSeat);
            }   
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
           
        }

        private void SeansDataGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ObjectCeans SelectedItem = (ObjectCeans)SeansDataGrid.SelectedItem;
            int CountSeat = DataBase.Halls.Where(x => SelectedItem.HallNumber == x.Id).Select(x => x.CountSeat).FirstOrDefault();
            GenerateButton(CountSeat);
        }
    }
}