using System;
using System.Data.Entity;
using System.Threading.Tasks;
using System.Windows;
using TradeApp.Model.Database;

namespace TradeApp.ViewModel
{
    public class AuthorizationVM : BaseVM
    {
        private string _login;
        private string _password;
        private string _btnContent = "Войти";

        public string Login
        {
            get => _login;
            set
            {
                _login = value;
                OnPropertyChanged(nameof(Login));
            }
        }

        public string Password
        {
            get => _password;
            set
            {
                _password = value;
                OnPropertyChanged(nameof(Password));
            }
        }

        public string BtnContent
        {
            get => _btnContent;
            set
            {
                _btnContent = value;
                OnPropertyChanged(nameof(BtnContent));
            }
        }

        public async Task<bool> ValidateAuthorizationAsync()
        {
            try
            {
                BtnContent = "Ожидайте...";

                using (var context = new TradeDBEntities())
                {
                    var user = await context.User.FirstOrDefaultAsync(u => u.UserLogin == Login && u.UserPassword == Password);
                    if (user != null)
                    {
                        return true;
                    }
                    else return false;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Stop);
            }
            finally
            {
                BtnContent = "Войти";
            }
            return false;
        }
    }
}
