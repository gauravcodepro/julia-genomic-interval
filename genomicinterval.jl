#! /usr/bin/env julia
# Author Gaurav 
# Date 2024-7-8
# a genomic interval search implemented for the search of the annotation. 

function genomicinterval(genomeannotationfile,
                                     startcoordinate,
                                         endcoordinate,
                                             writecoordinates)
    if !genomeannotationfile
           error("genomeannotationfile is needed")
    end
    return
    if genomeannotationfile && startcoordinate && writecoordinates
        geneName = Any[]
        geneStart = Any[]
        geneEnd = Any[]
        geneStrand = Any[]
        readann = readlines(open(genomeannotationfile))
        for i in 1:length(readann)
            if split(chomp(readann[i]), r"\t")[3] == "gene"
            push!(geneName,split(chomp(readann[i]), "\t")[1])
            push!(geneStart, parse(Int32, split(chomp(readann[i]),r"\t")[4]))
            push!(geneEnd, parse(Int32, split(chomp(readann[i]), r"\t")[5]))
            end
        end
        exonName = Any[]
        exonStart = Any[]
        exonEnd = Any[]
        exonStrand = Any[]
         for i in 1:length(readann)
            if split(chomp(readann[i]), r"\t")[3] == "exon"
            push!(geneName,split(chomp(readann[i]), "\t")[1])
            push!(exonStart, parse(Int32, split(chomp(readann[i]),r"\t")[4]))
            push!(exonEnd, parse(Int32, split(chomp(readann[i]), r"\t")[5]))
            end
        end
        cdsName = Any[]
        cdsStart = Any[]
        cdsEnd = Any[]
        cdsStrand = Any[]
         for i in 1:length(readann)
            if split(chomp(readann[i]), r"\t")[3] == "CDS"
            push!(geneName,split(chomp(readann[i]), "\t")[1])
            push!(cdsStart, parse(Int32, split(chomp(readann[i]),r"\t")[4]))
            push!(cdsEnd, parser(Int32, split(chomp(readann[i]), r"\t")[5]))
            end
        end
        transcriptName = Any[]
        transcriptStart = Any[]
        transcriptEnd = Any[]
        transcriptStrand = Any[]
         for i in 1:length(readann)
            if split(chomp(readann[i]), r"\t")[3] == "transcript"
            push!(geneName,split(chomp(readann[i]), "\t")[1])
            push!(transcriptStart, parse(Int32, split(chomp(readann[i]),r"\t")[4]))
            push!(transcriptEnd, parse(Int32, split(chomp(readann[i]), r"\t")[5]))
            end
        end
        coordinate = parse(Int32, coordinate)
        writecoordinates = IOBuffer()
        for i in 1:length(geneStart)
            if geneStart[i] <= startcoordinate 
                write(writecoordinates, "The coordinates for the gene are:", geneStart[i], "\t", geneEnd[i])
            end
        end
        for i in 1:length(exonStart)
            if exonStart[i] <= startcoordinate 
                write(writecoordinates, "The coordinates for the exon are:", exonStart[i], "\t", exonEnd[i])
            end
        end
        for i in 1:length(transcriptStart)
            if transcriptStart[i] <= startcoordinate 
                write(writecoordinates, "The coordinates for the transcript are:", transcriptStart[i], "\t", transcriptEnd[i])
            end
        end
    end
      if genomeannotationfile && endcoordinate && writecoordinates
        geneName = Any[]
        geneStart = Any[]
        geneEnd = Any[]
        geneStrand = Any[]
        readann = readlines(open(genomeannotationfile))
        for i in 1:length(readann)
            if split(chomp(readann[i]), r"\t")[3] == "gene"
            push!(geneName,split(chomp(readann[i]), "\t")[1])
            push!(geneStart, parse(Int32, split(chomp(readann[i]),r"\t")[4]))
            push!(geneEnd, parse(Int32, split(chomp(readann[i]), r"\t")[5]))
            end
        end
        exonName = Any[]
        exonStart = Any[]
        exonEnd = Any[]
        exonStrand = Any[]
         for i in 1:length(readann)
            if split(chomp(readann[i]), r"\t")[3] == "exon"
            push!(geneName,split(chomp(readann[i]), "\t")[1])
            push!(exonStart, parse(Int32, split(chomp(readann[i]),r"\t")[4]))
            push!(exonEnd, parse(Int32, split(chomp(readann[i]), r"\t")[5]))
            end
        end
        cdsName = Any[]
        cdsStart = Any[]
        cdsEnd = Any[]
        cdsStrand = Any[]
         for i in 1:length(readann)
            if split(chomp(readann[i]), r"\t")[3] == "CDS"
            push!(geneName,split(chomp(readann[i]), "\t")[1])
            push!(cdsStart, parse(Int32, split(chomp(readann[i]),r"\t")[4]))
            push!(cdsEnd, parser(Int32, split(chomp(readann[i]), r"\t")[5]))
            end
        end
        transcriptName = Any[]
        transcriptStart = Any[]
        transcriptEnd = Any[]
        transcriptStrand = Any[]
         for i in 1:length(readann)
            if split(chomp(readann[i]), r"\t")[3] == "transcript"
            push!(geneName,split(chomp(readann[i]), "\t")[1])
            push!(transcriptStart, parse(Int32, split(chomp(readann[i]),r"\t")[4]))
            push!(transcriptEnd, parse(Int32, split(chomp(readann[i]), r"\t")[5]))
            end
        end
        coordinate = parse(Int32, coordinate)
        writecoordinates = IOBuffer()
        for i in 1:length(geneStart)
            if geneEnd[i] <= endcoordinate 
                write(writecoordinates, "The coordinates for the gene are:", geneStart[i], "\t", geneEnd[i])
            end
        end
        for i in 1:length(exonStart)
            if exonEnd[i] <= endcoordinate 
                write(writecoordinates, "The coordinates for the exon are:", exonStart[i], "\t", exonEnd[i])
            end
        end
        for i in 1:length(transcriptStart)
            if transcriptEnd[i] <= endcoordinate 
                write(writecoordinates, "The coordinates for the transcript are:", transcriptStart[i], "\t", transcriptEnd[i])
            end
        end
    end
end