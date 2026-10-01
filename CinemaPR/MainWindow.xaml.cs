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
        public List<int> selectedSeats = new List<int>();

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
                clickedButton.Background = (Brush)new BrushConverter().ConvertFrom("#5646A8");
                selectedSeats.Remove(seatNumber);
            }
            else
            {
                clickedButton.Tag = "Active";
                clickedButton.Background = (Brush)new BrushConverter().ConvertFrom("#4E85EB");
                selectedSeats.Add(seatNumber);
            }
        }

        public void GenerateButton(int CountSeat)
        {
            if(CountSeat == null || CountSeat == 0)
            {
                
            }
            else
            {
                selectedSeats.Clear();
                MyContainer.Children.Clear();
                ObjectCeans sean = (ObjectCeans)SeansDataGrid.SelectedItem;
                List<int> TicketsForSeans = DataBase.Tickets.Where(x => x.SeansFk == sean.Sean.Id).Select(x => x.NumberSeatFk).ToList();
                for (int i = 0; i <= CountSeat; i++)
                {
                    Button ButtonSeat = new Button();
                    ButtonSeat.Content = i.ToString();
                    ButtonSeat.Width = 25;
                    ButtonSeat.Height = 25;
                    ButtonSeat.Click += ButtonSeatEvent;
                    ButtonSeat.Background = (Brush)new BrushConverter().ConvertFrom("#5646A8");

                    //если есть место блокируем
                    if (TicketsForSeans.Contains(i))
                    {
                        ButtonSeat.IsEnabled = false;
                        ButtonSeat.Background = (Brush)new BrushConverter().ConvertFrom("#211E68");
                    }

                    ButtonSeat.Resources.Add(typeof(Border), new Style(typeof(Border))
                    {
                        Setters = { new Setter(Border.CornerRadiusProperty, new CornerRadius(5)) } 
                    });
                    ButtonSeat.Margin = new Thickness(5);
                    MyContainer.Children.Add(ButtonSeat);
                }   
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

        private void ButtonTickets_Click(object sender, RoutedEventArgs e)
        {
            foreach( int Seat in selectedSeats)
            {
                ObjectCeans sean = (ObjectCeans)SeansDataGrid.SelectedItem;
                Ticket ticket = new Ticket
                {
                    NumberSeatFk = Seat,
                    SeansFk = sean.Sean.Id
                };
                DataBase.Tickets.Add(ticket);
                DataBase.SaveChanges();
                MessageBox.Show("Билеты купленны");
            }
            ObjectCeans SelectedItem = (ObjectCeans)SeansDataGrid.SelectedItem;
            int CountSeat = DataBase.Halls.Where(x => SelectedItem.HallNumber == x.Id).Select(x => x.CountSeat).FirstOrDefault();
            GenerateButton(CountSeat);
        }
    }
}