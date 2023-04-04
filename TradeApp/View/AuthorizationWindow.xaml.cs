using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using TradeApp.View;
using TradeApp.ViewModel;

namespace TradeApp
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class AuthorizationWindow : Window
    {
        public AuthorizationWindow()
        {
            InitializeComponent();
        }

        private async void btnEnter_Click(object sender, RoutedEventArgs e)
        {
            (DataContext as AuthorizationVM).Password = pbPassword.Password;

            if (await (DataContext as AuthorizationVM).ValidateAuthorizationAsync())
            {
                new BasicWindow().Show();
                this.Hide();
            }
            else
                MessageBox.Show("Неверный логин или пароль.","Ошибка авторизации",MessageBoxButton.OK, MessageBoxImage.Stop);
        }
    }
}
