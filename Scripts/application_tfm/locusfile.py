from locust import HttpUser, task , between

class WebSiteTestUser(HttpUser):
    def on_start(self):
        """ ********* Comienzo de tarea **************"""

    def on_stop(self):
        """ ********* Fin de tarea **************"""

    @task(1)
    def test_tfm_base(self):
        self.client.get("http://localhost:5000/select-test-tfm")