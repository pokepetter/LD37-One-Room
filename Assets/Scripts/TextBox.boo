import UnityEngine
import UnityEngine.UI
import System.IO
import System.Collections

class TextBox (MonoBehaviour):
    
    public textMesh as TextMesh
    [TextArea(10, 50)]
    public text as string
    private words as (string)

    public maxWidth as int

    private width as single
    private charWidth as single
    private i as int
    private sourceText as string
    private textRenderer as Renderer
    private currentLineLength as int

    def Awake():
        textRenderer = textMesh.GetComponent(Renderer)
        textMesh.text = ""


    def Update():
        if Input.GetKeyDown(KeyCode.Escape):
            i = text.Length-1

    def ShowText():
        StartCoroutine(ShowTextRoutine())
           

    def ShowTextRoutine() as IEnumerator:
        i = 0
        currentLineLength = 0
        textMesh.text = ""
        words = text.Split(char.Parse(" "))

        while i < words.Length:

            if currentLineLength + words[i].Length >= maxWidth:

                textMesh.text += '\n'
                currentLineLength = 0


            textMesh.text += words[i] + " "
            # textSound.pitch = 1 * Random.Range(0.9f, 1.1f)
            # textSound.Play()
            
            yield WaitForSeconds(0.05f)
            currentLineLength += words[i].Length
            i++

        yield null