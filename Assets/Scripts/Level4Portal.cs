using UnityEngine.SceneManagement;
using UnityEngine;

public class Level4Portal : MonoBehaviour
{
    private void OnTriggerEnter(Collider other) {
        SceneManager.LoadScene("Finish", LoadSceneMode.Single);
    }
}
