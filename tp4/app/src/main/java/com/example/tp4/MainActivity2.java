package com.example.tp4;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity2 extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main2);

        String[] colors = getResources().getStringArray(R.array.colors);
        ListView listView = findViewById(R.id.colors);

        ArrayAdapter<String> adapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, colors);
        listView.setAdapter(adapter);

        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                int selectedColor = getColorForPosition(position);

                Intent resultIntent = new Intent();
                resultIntent.putExtra("selectedColor", selectedColor);
                setResult(RESULT_OK, resultIntent);
                finish();
            }
        });
    }

    private int getColorForPosition(int position) {
        switch (position) {
            case 0: return getResources().getColor(R.color.yellow);
            case 1: return getResources().getColor(R.color.green);
            case 2: return getResources().getColor(R.color.blue);
            case 3: return getResources().getColor(R.color.red);
            default: return getResources().getColor(R.color.white);
        }
    }
}
