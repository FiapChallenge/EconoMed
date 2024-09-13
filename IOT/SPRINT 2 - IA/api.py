from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import numpy as np
import pandas as pd
import tensorflow as tf
from sklearn.preprocessing import StandardScaler
import joblib


model_rn = tf.keras.models.load_model("utils/model_rn_saved")

app = FastAPI()


class InsuredData(BaseModel):
    age: int
    sex: str
    bmi: float
    children: int
    smoker: str
    region: str


scaler = joblib.load("utils/scaler.pkl")


def preprocess_data(data: InsuredData):
    df = pd.DataFrame([data.model_dump()])

    df["genero"] = df["sex"].apply(lambda x: 0 if x == "male" else 1)
    df["fumante"] = df["smoker"].apply(lambda x: 1 if x == "yes" else 0)

    # One-hot encoding para a coluna "region" criando três colunas "northwest", "southeast" e "southwest" e se for "northeast" todas as três colunas serão False
    if df["region"].values[0] not in [
        "northeast",
        "northwest",
        "southeast",
        "southwest",
    ]:
        raise ValueError(
            "Região inválida (Deve ser 'northeast', 'northwest', 'southeast' ou 'southwest')"
        )

    df["northwest"] = df["region"].apply(lambda x: True if x == "northwest" else False)
    df["southeast"] = df["region"].apply(lambda x: True if x == "southeast" else False)
    df["southwest"] = df["region"].apply(lambda x: True if x == "southwest" else False)

    df.drop(columns=["sex", "smoker", "region"], inplace=True)

    df_scaled = scaler.transform(df)
    print(df_scaled)

    return df_scaled


@app.post("/predict/")
async def predict_cost(data: InsuredData):
    try:
        processed_data = preprocess_data(data)

        prediction = model_rn.predict(processed_data)

        formatted_prediction = round(float(prediction[0][0]), 2)

        return {"predicted_expenses": formatted_prediction}
    except ValueError as e:
        raise HTTPException(status_code=400, detail=str(e))
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))


if __name__ == "__main__":
    import uvicorn

    uvicorn.run(app, host="127.0.0.1", port=8000)


""" Exemplo de requisição POST para o endpoint /predict/:
{
  "age": 37,
  "sex": "male",
  "bmi": 29.8,
  "children": 2,
  "smoker": "no",
  "region": "northeast"
}
"""
