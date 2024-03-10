using System;
using UnityEditor;
using UnityEngine;
using UnityEngine.UI;

public class PlayerController : MonoBehaviour
{
    private Rigidbody rb;
    [Header("Camera Variables")]
    public Camera playerCamera;
    public float fov = 60f;
    public bool cameraCanMove = true;
    public float mouseSensitivity = 2f;
    public float maxLookAngle = 90f;
    public bool lockCursor = true;
    private float yaw = 0.0f;
    private float pitch = 0.0f;
    [Header("Movement Variables")]
    public bool playerCanMove = true;
    public float walkSpeed = 5f;
    public float maxVelocityChange = 10f;
    [Header("Pick Up Variables")]
    private RaycastHit heldObj = new RaycastHit();
    private bool holding = false;
    public float pullForce;
    private float originalDist;

    private UIManager uiManager;


    private void Awake() {
        rb = GetComponent<Rigidbody>();
        playerCamera.fieldOfView = fov;
        uiManager = GameObject.FindAnyObjectByType<UIManager>();
    }

    void Start() {
        if (lockCursor) {
            Cursor.lockState = CursorLockMode.Locked;
        }
    }
    float camRotation;

    private void Update() {
        if (cameraCanMove && !uiManager.inMenu) {
            PickUp();
            yaw = transform.localEulerAngles.y + Input.GetAxis("Mouse X") * mouseSensitivity;
            pitch -= mouseSensitivity * Input.GetAxis("Mouse Y");
            pitch = Mathf.Clamp(pitch, -maxLookAngle, maxLookAngle);
            transform.localEulerAngles = new Vector3(0, yaw, 0);
            playerCamera.transform.localEulerAngles = new Vector3(pitch, 0, 0);
        }
    }

    void FixedUpdate() {
        if (playerCanMove && !uiManager.inMenu) {
            Vector3 targetVelocity = new Vector3(Input.GetAxis("Horizontal"), 0, Input.GetAxis("Vertical"));
            targetVelocity = transform.TransformDirection(targetVelocity) * walkSpeed;
            Vector3 velocity = rb.velocity;
            Vector3 velocityChange = (targetVelocity - velocity);
            velocityChange.x = Mathf.Clamp(velocityChange.x, -maxVelocityChange, maxVelocityChange);
            velocityChange.z = Mathf.Clamp(velocityChange.z, -maxVelocityChange, maxVelocityChange);
            velocityChange.y = 0;
            rb.AddForce(velocityChange, ForceMode.VelocityChange);
        }
        PickUpPull();
    }

    private void PickUp() {
        if (Input.GetMouseButton(0)) {
            if (!holding) {
                Physics.Raycast(playerCamera.transform.position, playerCamera.transform.TransformDirection(Vector3.forward), out heldObj, 5f);
                if (heldObj.collider)
                {
                    if (heldObj.transform.CompareTag("PickUp"))
                    { 
                        originalDist = Vector3.Distance(heldObj.transform.position, playerCamera.transform.position);
                        holding = true;
                    }
                }
            }
        }
        if (Input.GetMouseButtonUp(0)) {
            heldObj = new RaycastHit();
            holding = false;
        }
    }

    private void PickUpPull() {
        if (holding && (heldObj.transform.CompareTag("PickUp") || heldObj.transform.CompareTag("SpellPage"))) {
            Vector3 target = playerCamera.transform.position + playerCamera.transform.forward * originalDist;
            Vector3 toTarget = target - heldObj.transform.position;
            float springForceMagnitude = pullForce * toTarget.magnitude;
            Vector3 dampingForce = -0.1f * heldObj.transform.GetComponent<Rigidbody>().velocity;
            heldObj.transform.GetComponent<Rigidbody>().AddForce(springForceMagnitude * toTarget.normalized + dampingForce, ForceMode.VelocityChange);
        }
    }
}