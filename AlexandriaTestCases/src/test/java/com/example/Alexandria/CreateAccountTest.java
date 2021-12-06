package test.java.com.example.Alexandria;
import java.util.regex.Pattern;
import java.util.concurrent.TimeUnit;
import org.junit.*;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;
import org.openqa.selenium.*;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.Select;
import org.apache.commons.io.FileUtils;
import java.io.File;

public class CreateAccountTest {
  private WebDriver driver;
  private String baseUrl;
  private boolean acceptNextAlert = true;
  private StringBuffer verificationErrors = new StringBuffer();
  JavascriptExecutor js;
  @Before
  public void setUp() throws Exception {
    System.setProperty("webdriver.chrome.driver", "D:\\CSCI_4830_2\\workspace4830\\Alexandria\\AlexandriaTestCases\\lib\\win\\chromedriver.exe");
    driver = new ChromeDriver();
    baseUrl = "https://www.google.com/";
    driver.manage().timeouts().implicitlyWait(60, TimeUnit.SECONDS);
    js = (JavascriptExecutor) driver;
  }

  @Test
  public void testCreateAccount() throws Exception {
    driver.get("http://ec2-18-217-199-195.us-east-2.compute.amazonaws.com:8080/Alexandria/Account.jsp");
    driver.manage().window().maximize();
    driver.findElement(By.id("inputEmail")).click();
    Thread.sleep(2000);
    driver.findElement(By.id("inputEmail")).clear();
    Thread.sleep(2000);
    driver.findElement(By.id("inputEmail")).sendKeys("createAccount@unomaha.edu");
    Thread.sleep(2000);
    driver.findElement(By.id("inputUsernameId")).clear();
    Thread.sleep(2000);
    driver.findElement(By.id("inputUsernameId")).sendKeys("createAccountUser");
    Thread.sleep(2000);
    driver.findElement(By.id("inputPasswordId")).clear();
    Thread.sleep(2000);
    driver.findElement(By.id("inputPasswordId")).sendKeys("createAccountPassword");
    Thread.sleep(2000);
    driver.findElement(By.id("createAccountButton")).click();
    Thread.sleep(2000);
  }

  @After
  public void tearDown() throws Exception {
    driver.quit();
    String verificationErrorString = verificationErrors.toString();
    if (!"".equals(verificationErrorString)) {
      fail(verificationErrorString);
    }
  }

  private boolean isElementPresent(By by) {
    try {
      driver.findElement(by);
      return true;
    } catch (NoSuchElementException e) {
      return false;
    }
  }

  private boolean isAlertPresent() {
    try {
      driver.switchTo().alert();
      return true;
    } catch (NoAlertPresentException e) {
      return false;
    }
  }

  private String closeAlertAndGetItsText() {
    try {
      Alert alert = driver.switchTo().alert();
      String alertText = alert.getText();
      if (acceptNextAlert) {
        alert.accept();
      } else {
        alert.dismiss();
      }
      return alertText;
    } finally {
      acceptNextAlert = true;
    }
  }
}
