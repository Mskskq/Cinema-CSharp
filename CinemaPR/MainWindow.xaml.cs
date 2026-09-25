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
        }
        CinemaContext DataBase = new CinemaContext();

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

        private List<string> GenerateSeatsList(int totalSeats)
        {
            List<string> seats = new List<string>();
    
            // Просто генерируем номера мест по порядку от 1 до общего количества
            for (int i = 1; i <= totalSeats; i++)
            {
                seats.Add(i.ToString());
            }
    
            return seats;
        }
        


        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            GenerateDataGridSeand();
        }

        private void SeansDataGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ObjectCeans SelectedSeans = (ObjectCeans)SeansDataGrid.SelectedItem;
            int TotalCountSeat = SelectedSeans.Sean.HallFkNavigation.CountSeat;
            //MessageBox.Show(TotalCountSeat.ToString());
            List<string> generatedSeats = GenerateSeatsList(TotalCountSeat);

            // ИСПРАВЛЕНИЕ: Передаем сгенерированный список в ваш ListBox на экране
            SeatsListBox.ItemsSource = generatedSeats;
        }
    }
}