//
//  DetailLabelView.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/14.
//

import SwiftUI

struct DetailLabelView: View {
    
    var itemLabel: String
    var itemLabelSize: CGFloat
    var itemLabelFontWeght: Font.Weight
    
    var valueLabel: String
    var valueLabelSize: CGFloat
    var valueLabelFontWeght: Font.Weight
    
    init(itemLabel: String,
         _ itemLabelSize: CGFloat = 20,
         _ itemLabelFontWeght: Font.Weight = .bold,
         valueLabel: String,
         _ valueLabelSize: CGFloat = 18,
         _ valueLabelFontWeght: Font.Weight = .regular) {
        self.itemLabel = itemLabel
        self.itemLabelSize = itemLabelSize
        self.itemLabelFontWeght = itemLabelFontWeght
        self.valueLabel = valueLabel
        self.valueLabelSize = valueLabelSize
        self.valueLabelFontWeght = valueLabelFontWeght
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(itemLabel)
                .font(.system(size: itemLabelSize, weight: itemLabelFontWeght))
            //.frame(maxWidth: .infinity)
            Text(valueLabel)
                .font(.system(size: valueLabelSize, weight: valueLabelFontWeght))
            //./frame(maxWidth: .infinity)
        }
        .padding(4)
        // .frame(maxWidth: .infinity)
    }
}

struct DetailLabelView_Previews: PreviewProvider {
    static var previews: some View {
        DetailLabelView(itemLabel: "Title", 30, .bold,
                        valueLabel: "value", 18, .regular)
            .previewLayout(.fixed(width: 300, height: 100))
    }
}
